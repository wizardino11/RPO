import React from 'react';
import { Link } from 'react-router-dom'
import { Nav } from 'react-bootstrap'
import {faGlobe, faPallet, faUniversity, faImage, faUser} from "@fortawesome/free-solid-svg-icons";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";

const SideBar = props => {
    return (
        <Nav className={"flex-column my-sidebar my-sidebar-expanded"}>
            { props.expanded &&
                    <Nav.Item>
                        <Nav.Link as={Link} to="/countries"><FontAwesomeIcon icon={faGlobe} />{' '}Страны</Nav.Link>
                </Nav.Item>
                }
            { !props.expanded &&
                    <Nav.Item>
                        <Nav.Link as={Link} to="/countries"><FontAwesomeIcon icon={faGlobe} size="2x" /></Nav.Link>
                    </Nav.Item>
                }
            {props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/artists"><FontAwesomeIcon icon={faPallet}/>{' '}Художники</Nav.Link>
                </Nav.Item>
            }

            {!props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/artists"><FontAwesomeIcon icon={faPallet} size="2x"/></Nav.Link>
                </Nav.Item>
            }

            {props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/museums"><FontAwesomeIcon icon={faUniversity}/>{' '}Музеи</Nav.Link>
                </Nav.Item>
            }

            {!props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/museums"><FontAwesomeIcon icon={faUniversity} size="2x"/></Nav.Link>
                </Nav.Item>
            }

            {props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/paintings"><FontAwesomeIcon icon={faImage}/>{' '}Картины</Nav.Link>
                </Nav.Item>
            }

            {!props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/paintings"><FontAwesomeIcon icon={faImage} size="2x"/></Nav.Link>
                </Nav.Item>
            }

            {props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/users"><FontAwesomeIcon icon={faUser}/>{' '}Пользователи</Nav.Link>
                </Nav.Item>
            }

            {!props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/users"><FontAwesomeIcon icon={faUser} size="2x"/></Nav.Link>
                </Nav.Item>
            }

            {props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/my_account"><FontAwesomeIcon icon={faUser}/>{' '}Мой аккаунт</Nav.Link>
                </Nav.Item>
            }

            {!props.expanded &&
                <Nav.Item>
                    <Nav.Link as={Link} to="/my_account"><FontAwesomeIcon icon={faUser} size="2x"/></Nav.Link>
                </Nav.Item>
            }

        </Nav>
    );
            }
            export default SideBar;